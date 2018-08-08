function [nearest,nearestIndex] = kd_search(rootIndex,Tree,target)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ����
% 2018/8/6
% kd�������ڽ�����
% rootIndex�����ݵ㼯������kd���ĸ��ڵ��±�(����cell�е�λ�ã�
% target��Ŀ�������
% Tree��kd����cell����
% nearst���㼯�о���Ŀ�������ĵ��±�
% nearst���㼯�о���Ŀ�������ĵ�����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
currentNode = rootIndex; %��ǰ�ڵ��±꣬�Ӹ��ڵ㿪ʼ����
currentNode = search_down(Tree,currentNode,target);% ��currentNode�����������ײ�
Tree{currentNode}.visited = 1;
    
currentNearest = Tree{currentNode}.val;                    % ��ǰ�����
currentNearestDist = norm(currentNearest-target);    % ��ǰ�������
currentNearestIndex = currentNode;
   
while Tree{currentNode}.isRoot == 0
    isLeft = Tree{currentNode}.isLeft;     %��ǰ�ڵ������ӱ�־
    currentNode = Tree{Tree{currentNode}.parent}.index;
    if Tree{currentNode}.visited == 0
        Tree{currentNode}.visited = 1;%���Ϊ�ѷ���
        temp = norm(Tree{currentNode}.val-target);
        if temp<currentNearestDist
            currentNearest = Tree{currentNode}.val;
            currentNearestDist = temp;
            currentNearestIndex = currentNode;
        end
        temp = abs(Tree{currentNode}.val(Tree{currentNode}.r)-target(Tree{currentNode}.r));   %�뵱ǰ�ָ��ߵľ���
        if temp<currentNearestDist 
            %��ǰ�ָ��߾���С�ڵ�ǰ��С���룬�ڷָ�����һ�߿����и����㣬��������һ�߼�������
            if isLeft == 1
                if Tree{currentNode}.hasRight == 1 %��ǰ�ڵ�����ӣ��ҵ�ǰ�ڵ����Һ��ӣ��������Һ���
                    currentNode = Tree{Tree{currentNode}.right}.index;
                    currentNode = search_down(Tree,currentNode,target); 
                    Tree{currentNode}.visited = 1;%���Ϊ�ѷ���
                    temp = norm(target - Tree{currentNode}.val);
                    if temp < currentNearestDist
                        currentNearest = Tree{currentNode}.val;
                        currentNearestDist = temp;
                        currentNearestIndex = currentNode;
                    end
                end
            else
                if Tree{currentNode}.hasLeft == 1  %��ǰ�ڵ����Һ��ӣ��Ҹ��׽ڵ������ӣ����������׽ڵ������
                    currentNode = Tree{Tree{currentNode}.left}.index;
                    currentNode = search_down(Tree,currentNode,target);
                    Tree{currentNode}.visited = 1;%���Ϊ�ѷ���
                    temp = norm(target - Tree{currentNode}.val);
                    if temp < currentNearestDist
                        currentNearest = Tree{currentNode}.val;
                        currentNearestDist = temp;
                        currentNearestIndex = currentNode;
                    end
                end
            end
        end
    end
end
nearest = currentNearest;
nearestIndex = currentNearestIndex;
            
        
            
        
